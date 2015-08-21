
module.exports = ( grunt ) ->

  grunt.initConfig

    pkg : grunt.file.readJSON "package.json"

    clean :
      js : [ "*.{js,map}", "{build,lib}/**/*.{map,js}" ]
      dist : [ "dist/**/*" ]

    coffee :
      options :
        sourceMap : false
        bare : true
        force : true

      default :
        expand : true
        dest : "build/"
        src : [ '**/*.coffee' ]
        cwd : "lib/"
        ext : '.js'

      main :
        expand : true
        src : [ '*.coffee' ]
        ext : '.js'


  for t in [ "execute", "contrib-watch", "contrib-coffee", "contrib-clean",
             "aws-lambda", "contrib-copy" ]
    grunt.loadNpmTasks "grunt-#{t}"

  grunt.registerTask "default", [ "clean", "coffee"]


