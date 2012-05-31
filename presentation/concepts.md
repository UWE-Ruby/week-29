!SLIDE quote

# Concepts

!SLIDE

## Where to Start

```ruby
class PostsController < ApplicationController

  def index
    render :locals => { :posts => posts, :show_create_post => user_is_current_user? }
  end

end
```

!SLIDE

## [respond_to](http://guides.rubyonrails.org/action_controller_overview.html#rendering-xml-and-json-data)

```ruby
def index
  respond_to do |format|
    format.html
    format.xml  { render :xml => posts }
    format.json { render :json => posts }
  end
end
```

!SLIDE

## Missing Template

```html
Template is missing

Missing template posts/index, application/index with {:locale=>[:en], :formats=>[:json], :handlers=>[:erb, :builder, :coffee, :haml]}. Searched in: * "/Volumes/Glacier/git/uw-ruby/week-29/app/views" * "/Users/burtlo/.rvm/gems/ruby-1.9.2-p320@uw-ruby/gems/devise-2.1.0.rc2/app/views"
```

!SLIDE

## Manual Templating

```ruby
# within index.json.erb

[<%- posts.each do |post| >
{ "user" : "<%= post.user.name %>"}
<% end %>]

```


!SLIDE 

## [JBuilder](https://github.com/rails/jbuilder)

```ruby
# within index.json.jbuilder

json.array!(posts) do |json, post|
  json.user post.user.name
  # ...
end
```