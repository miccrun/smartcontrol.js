#global module:false

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.initConfig
    mochaTest:
      unittest:
        options:
          ui: 'bdd',
          reporter: 'spec',
          require: [
            'coffee-script/register'
            'test/helper.coffee'
          ]
        src: ['test/unit/**/*.coffee']
      acceptance:
        options:
          ui: 'bdd',
          reporter: 'spec',
          require: [
            'coffee-script/register'
            'test/helper.coffee'
          ]
        src: ['test/acceptance/**/*.coffee']

  grunt.registerTask 'default', ['mochaTest']
