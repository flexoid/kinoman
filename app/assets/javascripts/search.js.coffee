class @GlobalSearch

  @initialize: ->
    search = $('#global-search').typeahead(
      [{
        name: 'movies',
        remote: '/search/movies?q=%QUERY',
        limit: 5,
        template: @movieTemplate(),
        engine: Hogan,
        valueKey: 'title'
      },
      {
        name: 'people',
        remote: '/search/people?q=%QUERY',
        limit: 5,
        template: @personTemplate(),
        engine: Hogan,
        valueKey: 'name'
      }]
    )

    search.on 'typeahead:selected', (e, element) ->
      Turbolinks.visit(element.url)

  @movieTemplate: ->
    $('.search_templates .movie').html()

  @personTemplate: ->
    $('.search_templates .person').html()
