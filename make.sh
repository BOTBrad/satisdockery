function build() { docker build -t satisdockery:latest ./; }
function run() { docker run satisdockery:latest; }

case $1 in
  "build")
	  build
    ;;

  "run")
	  run
    ;;

  *)
    build && run
    ;;
esac
