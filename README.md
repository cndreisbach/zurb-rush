zurb-rush
=========

Zurb Rush is a collection of helpers and a form builder for Zurb Foundation 3.

## Installation

Add this line to your application's Gemfile:

    gem 'zurb-rush'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zurb-rush

## Usage

### The Form Builder

To start using the form builder, use the helper `foundation_form_for`.

```erb
<%= foundation_form_for @user do |f| %>
  <%= f.input :username %>
  <%= f.input :password %>
  <%= f.button :submit %>
<% end %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
