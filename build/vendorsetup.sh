prepare() {
  $(gettop)/device/lge/occam/build/prepare "$@"
}

kernel_build() {
  $(gettop)/device/lge/occam/build/kernel_build "$@"
}

echo "please prepare with following commands"
echo " $ lunch occam-user"
echo " $ kernel_build"
echo " $ prepare"
echo " $ make updatepackage"
