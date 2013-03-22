Ruby Gem will_pickdate
=================

Ruby gem wrapping will_pickdate javascript widget giving support for rails datetime_select to render it instead of the usuall set of select boxes.

Usage
=====

On your css (scss):

    @import "will_pickdate";

On your javascript (coffeescript):

    #= require will_pickdate

    # somewhere relevant for your app...
    i = document.createElement "input"
    if i.type != 'datetime'
      $('input[type="datetime"]').will_pickdate({})

On your views:

    = form_form @thing do |f| &>
      = f.datetime_field :starts_at %>


Customizing Looks
=================

    .wpd {
	    ...
    }

Customizing other stuff
=======================

Check will_pickdate repo for the javascript opts ;)
