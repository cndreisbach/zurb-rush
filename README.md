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

### The Grid

The Foundation grid is made up of rows and columns, which can be nested. You have two helpers for these with the obvious names `row` and `column`. These accept any number of arguments, which will be converted into class names on the row or column. Symbols will become strings; in addition, symbols (and only symbols) that have underscores in them will have the underscores converted to hyphens, thereby allowing you to specify the class "mobile-three" with the symbol `:mobile_three`.

```erb
<%= row do %>
  <%= column :four, :mobile_one do %>
    I saw the best minds of my generation
  <% end %>
  <%= column :eight, :mobile_three do %>
    destroyed by madness, starving hysterical naked
  <% end %>
<% end %>
```

### Alert Boxes and Flash Messages

Rails flash messages can be easily shown using Foundation's alert boxes. Foundation's alert boxes use a different naming scheme than the standard flash messages, so they are mapped, like so:

* Rails' `notice` -> Foundation's `success`
* Rails' `alert` -> Foundation's `alert`
* Rails' `info` -> Foundation's standard alert

This is specifically because `redirect_to` allows you to pass a flash message with the `:notice` and `:alert` keys. `info` has been mapped so you can use the standard alert box, since `alert` has been taken.

To display all your flash messages using Foundation's alerts, simply call `display_flash_messages`, like so:

```erb

<div id="header">
  <%= display_flash_messages %>
  ...
</div>
```

If you want to show an alert box outside of the flash messages, you can simply call `alert_box`:

```erb
<%= alert_box "This is a standard alert." %>
<%= alert_box :success, "This is a success alert." %>
<%= alert_box :alert, "This is an alert." %>
<%= alert_box :secondary, "This is a secondary alert." %>
```

### Labels

Labels are inline styles that can be used to call out certain sections or to display metadata. Do not confuse them with form labels. It is super-confusing.

```erb
<%= label "Regular Label" %>
<%= label :radius, "Radius Label" %>
<%= label :round, "Round Label" %>
<%= label :secondary, "Secondary Label" %>
<%= label :alert, :radius, "Alert Label with a Radius" %>
<%= label :success, :round, "Rounded Success Label" %>
```



### The Form Builder

To start using the form builder, use the helper `foundation_form_for`.

```erb
<%= foundation_form_for @user do |f| %>
  <%= f.input :username %>
  <%= f.input :password %>
  <%= f.button :submit %>
<% end %>
```

`input` can take many options, as seen below:

```erb
<%= foundation_form_for @user do |f| %>
  <%= f.input :username, :label => "Your name" %>
  <%= f.input :address, :hint => "Where you live", :field => {:class => 'eight'} %>
  <%= f.input :email, :as => :email, :placeholder => "you@example.com" %>
  <%= f.button :submit %>
<% end %>
```

You can even use inline inputs:

```erb
<%= foundation_form_for @user do |f| %>
  <%= f.input :username, :inline => ['two mobile-one', 'ten mobile-three'] %>
<% end %>
```

If you want to use Foundation forms, but need to separate the label and field, you can use the normal Rails form builder's methods, `label` and `text_field` (or `password_field` or others.) We also provide a `field` method that uses the same intelligent guessing as `input` so you don't have to do all the work.

```erb
<%= foundation_form_for @user do |f| %>
  <%= f.label :twitter %>
  <%= row do %>
    <%= column :four do %>
      <%= row :collapsed do %>
        <%= column :two, :mobile_one do %>
          <span class="prefix">@</span>
        <% end %>
        <%= column :ten, :mobile_three do %>
          <%= f.field :twitter %>
        <% end %>
      <% end %>
    <% end %>
  <% end %>
<% end %>
```
 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
