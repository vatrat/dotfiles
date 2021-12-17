
set -e

usage() {
  cat << EOH
Generate wallpapers to a specified size, given a base picture

$0 [-vs] width height [picture [picture [...]]]
$0 -h

-h : displays this help message
-s : use a "safer" and slower method to get the background color
-v : be verbose (set -x)

Example: $0 1920 1080 coolimage.png

The following syntax also works:
find . -type f -name '*.png' | $0 1080 1920
EOH
  exit ${1:-0}
}

die() {
  echo "$1" && exit "${2:-1}"
}

while getopts ":hvs" _opt; do
  case "$_opt" in
    h) usage       ;;
    s) _slow=1     ;;
    v) set -x      ;;
    *) usage 1 >&2 ;;
  esac
done

shift $((OPTIND-1))

if [ -n "$_slow" ]; then
  getbg() {
    # We get all hexa codes of all pixels in the picture, and pick the most
    # frequent one... which should be the background color?
    convert "$1" -format %c +dither -depth 5  histogram:info: |
      sort -nr | head -1 | grep -Eo '#[A-F0-9]{6}'
  }
else
  getbg() {
    # We get the color of the top-left pixel.
    convert "$1" -crop 1x1+0+0 -depth 8 txt: | grep -Eo '#[A-F0-9]{6}'
  }
fi

# We require width & height
# TODO: maybe auto-detect? seems tricky with dual screen
if [ $# -lt 2 ]; then
  usage 1 >&2
fi
width="$1"
height="$2"
shift 2

{ if [ -z "$1" ]; then
  # No arguments, we read stdin
  cat -
else
  for _file in "$@"; do
    printf '%s\n' "$_file"
  done
fi } |
while IFS= read -r inpfile; do
  outfile="$(basename "$inpfile")"
  bgcolor="$(getbg "$inpfile")"

  # We use the `-resize ..x..\>` syntax to only shrink pictures. Enlarging is
  # asking for trouble (artifacting, etc.)
  convert "$inpfile" -gravity center -resize "${width}x${height}>" \
    -background "$bgcolor" -extent "${width}x${height}" \
    "${outfile%.*}-${width}x${height}.${outfile##*.}"
done
