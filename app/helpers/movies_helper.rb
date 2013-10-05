module MoviesHelper

  def rating_input(movie)
    if current_user
      grade = current_user.grade_for_movie(movie)
      value = grade ? grade.value.round : movie.grade.round

      content_tag('input', '',
        type: 'number', name: 'rating', class: 'rating-input',
        value: value, :'data-min' => '1', :'data-max' => '10')
    else
      static_rating_start(movie.grade.round)
    end
  end

  def static_rating_start(rating)
    ''.tap do |html|
      rating.times { html << content_tag(:i, '', class: 'glyphicon glyphicon-star') }
      (10 - rating).times { html << content_tag(:i, '', class: 'glyphicon glyphicon-star-empty') }
    end.html_safe
  end
end
