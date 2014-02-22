clear

# need target folder
if [[ $# -eq 0 ]] ; then
    echo 'warning ! no target folder !'
    exit 0
fi

#set -x
#510,072,000 km2 

surface=0
sourcedir=$1

foot=9450;

dpi=300
inch=2.54
i=0
detox -vr $sourcedir

for f in `find $sourcedir -type f -iname "*.jpg"`
do
  
  w=$(identify -format "%w" "$f")
  h=$(identify -format "%h" "$f")
  
  let ++i
  
  sw=$(($sw + $w))
  sh=$(($sh + $h))
  
  tsw=$(echo "(($sw/$dpi)*$inch*0.01)" | bc)
  tsh=$(echo "(($sh/$dpi)*$inch*0.01)" | bc)
  
  sur=$(echo "($tsw*$tsh)" | bc)
  surfoot=$(echo "($sur/$foot)" | bc)
  
  printf " $i pictures @ $dpi dpi = $tsw x $tsh m = $sur m2 = $surfoot football field   \r"
done
printf '\n'