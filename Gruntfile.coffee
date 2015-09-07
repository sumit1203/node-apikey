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

      lib :
        expand : true
        dest : "dist/lib"
        src : [ '**/*.coffee' ]
        cwd : "lib/"
        ext : '.js'

      main :
        expand : true
        dest : "dist"
        src : [ 'index.coffee' ]
        ext : '.js'


  for t in [ "contrib-coffee", "contrib-clean" ]
    grunt.loadNpmTasks "grunt-#{t}"

  grunt.registerTask "default", [ "clean", "coffee" ]


