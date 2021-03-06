<h2>Version: 0.10.0</h2>

<h2>Intialization:</h2>

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
helper = Nretnil::CompendiumAPI::Helpers.new
```

<h2>Functions:</h2>

<h4>Notes:</h4>
- All Dates should be in the ISO8601 Format - 2015-06-26T11:43:00.000Z

<h3>Calendar:</h3>

```ruby

session.calendar.events(start_date,end_date)
session.calendar.add(name,start_date,options = {}) - ex: options = { color => "#00FF00", all_day => true, end_date => "2015-06-26T11:43:00.000Z"}
session.calendar.delete(event_id)
```

```
{
  "id": "6bx8ex06-2921-4x22-9axc-6xedxeec8xb8",
  "name": "Now",
  "description": "api calendar event",
  "color": "#abc123",
  "all_day": false,
  "start_date": "2014-07-03 12:14:37 UTC",
  "end_date": null,
  "icon": "fa-clock-o"
}
```

<h3>Calback:</h3>

```ruby

session.callback.fire(name,arguments) - ex: arguments = { :foo => bar, :baz => bos }
```

<h3>Category:</h3>

```ruby

session.category.list(options={}) - ex: options = { :NetworkId => '6bx8ex06-2921-4x22-9axc-6xedxeec8xb8' }
session.category.add(title,type,options = {})
session.category.edit(title,type)
session.category.delete(category_id)
```

```
{
  "BlogId": "1b824x10-fxd3-4cx3-8c9f-d2baac9e2bb1",
  "NetworkId": "758cx424-6055-4x3e-880c-4021x18d8x4e",
  "CategoryId": "c8xe4x96-fdx1-4x84-ax4b-fabx5441x704",
  "Type": "comp",
  "Title": "Biking",
  "Description": "Nature - Blog:Biking",
  "UrlToken": "biking",
  "Url": "http://www.nature.com/biking",
  "PostCount": "3",
  "ParentId": null,
  "Children": [

  ],
  "Attributes": {
    "Tags": [
      "Biking"
    ]
  }
}
```

<h3>Comment:</h3>

```ruby

session.comment.list(options={}) - ex: options = { :Count => count }
session.comment.get(comment_id)
session.comment.add(post_id, body, time, name, email, url=nil, options={})
session.comment.approve(comment_ids) - comment_ids = ["4c20x74f-x7e1-4cx2-bcxb-751xe4a3xccb","821xd165-dxde-42x2-9x96-b2xd4bx21x4d"]
session.comment.decline(comment_ids)
```

```
{
  "CommentId": "a9x82xd5-e87e-4xed-bx8a-1449xb23fx9f",
  "Title": "Great Post Man!",
  "PostAuthorId": "16x69x4e-1a0x-4x46-8d16-a6x1bx3fx2d7",
  "CreatorName": "John Smith",
  "CreatorEmail": "jsmith@gmail.com",
  "CreationTimestamp": "2014-07-02T20:38:37+00:00",
  "Status": "approved"
}
```

<h3>Content:</h3>

```ruby

session.content.list(options={}) - ex: options = { :Page => '1', :Count => '20' , :Status => ["approved"].to_json, :'~Status' => ["deleted"].to_json, :PublishStartDate => start_date, :PublishEndDate => end_date }
session.content.list_all(options={})
session.content.get(postid)
session.content.add(title,body,slug,publish_date,draft,options) - ex: options = { :Notify => false, :CategoryBlogs => ["4c20x74f-x7e1-4cx2-bcxb-751xe4a3xccb","821xd165-dxde-42x2-9x96-b2xd4bx21x4d"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
session.content.update(post_id,options)
session.content.delete(postid)
session.content.approve(post_ids,force=false) - ex: post_ids = ["4c20x74f-x7e1-4cx2-bcxb-751xe4a3xccb","821xd165-dxde-42x2-9x96-b2xd4bx21x4d"]
session.content.decline(post_ids)
```

```
{
  "PostId": "3d40acx9-96x2-4xeb-ab7x-ab5a97x2fxe3",
  "Title": "Spying",
  "UserId": "2be5x3xd-4622-4xcf-axe1-5xx4c2x7cxa0",
  "UserName": "mweston",
  "CreatorFirstName": "Michael",
  "CreatorLastName": "Weston",
  "CreationTimestamp": "2014-04-02T20:33:13+00:00",
  "PublicationTimestamp": "2014-04-02T20:33:00+00:00",
  "DisplayTimestamp": "2014-04-02T20:33:00+00:00",
  "Status": "approved",
  "AssignmentId": null,
  "DueDate": null,
  "ContentTypeId": "5d28xxc0-7xe8-43x6-bx68-a43x439cf863",
  "IsLive": true,
  "IsPublished": true,
  "AssignmentStatus": "None",
  "RemoteState": "synced",
  "CurrentModerator": "",
  "CustomProperties": [
    {
      "FieldId": "Favorite_Colors",
      "Value": "[\"Red\",\"Orange\",\"Green\",\"Indigo\"]",
      "MultiValued": true
    },
    {
      "FieldId": "Ice_Cream",
      "Value": "Vanilla",
      "MultiValued": false
    },
    {
      "FieldId": "Must_Read",
      "Value": "1",
      "MultiValued": false
    },
    {
      "FieldId": "Success_Grade",
      "Value": "9",
      "MultiValued": false
    }
  ],
  "Url": "http://www.burnnotice.com/spying",
  "Slug": "spying"
}
```

<h3>Content Groups:</h3>

```ruby
session.content_group.list
session.content_group.get(id)
session.content_group.add(name,config={})
session.content_group.add_item(id,content) - ex: content = ["4c20x74f-x7e1-4cx2-bcxb-751xe4a3xccb","821xd165-dxde-42x2-9x96-b2xd4bx21x4d"]
session.content_group.edit(id,config) - ex: config = { "content_width" => 500, "character_limit" => 300, "wide_thumbnail_height" => 200, "side_thumbnail_height" => 150, "side_thumbnail_width" => 150, "read_more_text" => "Continue Reading", "read_more_color" => "#000000", "body_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 13, "color" => "#000000" }, "title_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 20, "color" => "#000000"}, "byline_settings" => { "author" => false, "author_title" => false, "date" => false, "italic" => true, "size" => 12 }, "include_social_buttons" => true }
session.content_group.edit_item(group_id, item_id, config)
session.content_group.delete(group_id)
```

```
{
  "id": "7xcaccx7-f3x4-44xb-a6x0-8x7f6xcffx79",
  "name": "API Group",
  "create_date": "2014-07-02T17:00:47+00:00",
  "url": "/api/content_groups/7fcxcc87-f3x4-44xb-a67x-8x7fxacxffx9",
  "config": {
    "content_width": 500,
    "character_limit": 300,
    "wide_thumbnail_height": 200,
    "side_thumbnail_height": 150,
    "side_thumbnail_width": 150,
    "read_more_text": "Continue Reading",
    "read_more_color": "#000000",
    "body_settings": {
      "font": "'Trebuchet MS', Helvetica, sans-serif",
      "size": 13,
      "color": "#000000"
    },
    "title_settings": {
      "font": "'Trebuchet MS', Helvetica, sans-serif",
      "size": 20,
      "color": "#000000"
    },
    "byline_settings": {
      "author": false,
      "author_title": false,
      "date": false,
      "italic": true,
      "size": 12
    },
    "include_social_buttons": true
  },
  "items": [
    {
      "post_id": "07x1cad8-0x96-4x12-89x7-88fx8d6e37x3",
      "sort_order": 0,
      "config": {
        "layout": "left_thumbnail"
      }
    },
    {
      "post_id": "68x8bxe7-ex48-46x3-99x8-5xf81x6a66ax7a",
      "sort_order": 1,
      "config": {
        "layout": "left_thumbnail"
      }
    },
    {
      "post_id": "acx79xa4-9axd-4ax3-9xf2-84x9ae268x8d",
      "sort_order": 2,
      "config": {
        "layout": "right_thumbnail"
      }
    },
    {
      "post_id": "6bb9fxb9-78x4-4x6b-95x1-29609x21dx5a",
      "sort_order": 3,
      "config": {
        "layout": "left_thumbnail"
      }
    }
  ],
  "user": {
    "user_id": "16x69a4e-1a0a-42x6-8d16-a61xbf3fx2d7",
    "username": "mweston",
    "url": "/app/user/16769a4e-1a0a-4246-xd16-a6x1bfxf0xd7"
  },
  "network": {
    "network_id": "758c2x24-6x55-4dxe-8x0c-402x718dx14e",
    "company_name": "Test - ML"
  }
}
```

<h3>Custom Fields:</h3>

```ruby
session.custom_field.list
session.custom_field.get(custom_field_id = "")
session.custom_field.add(label, field_id, options ={}) - ex: options = { :type => "predefined", :options => ["Red","White","Blue"] }
session.custom_field.edit(id, options = {}) - ex: options = { :visibility => "advanced", :field_id => Time.new.to_i, :type => "multi-predefined", :options => ["Red","White","Blue","Purple"] }
session.custom_field.delete(custom_field_id)
```

```
{
  "id": "165bx5x9-1x68-4cx7-91xb-c4x0fxf9x2bx",
  "label": "Favorite Colors",
  "field_id": "Favorite_Colors",
  "type": "multi-predefined",
  "visibility": "below",
  "network_id": "7x8c24x4-60x5-4x3e-8x0c-40x17x8dx14x",
  "created_at": null,
  "updated_at": "2014-06-11T21:13:33+00:00",
  "field_order": 4,
  "options": [
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Blue",
    "Indigo",
    "Violet",
    "Black",
    "White"
  ],
  "content_type_filter": [

  ]
}
```

<h3>Export:</h3>

```ruby

session.export - returns xml output
```

<h3>Role:</h3>

```ruby

session.role.list(options = {})
session.role.add(name,permissions) - ex: permissions = [{:id => "categories.manage.network"},{:id => "campaigns.manage.network"},{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"},{:id => "analytics.read.self"}]
session.role.edit(role_id,options) - ex: options = { :name => "Role Name", permissions => [{:id => "categories.manage.network"},{:id => "campaigns.manage.network"},{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"},{:id => "analytics.read.self"}]}
session.role.assign(user_id,roles) - ex: roles = ["4c20x74f-x7e1-4cx2-bcxb-751xe4a3xccb","821xd165-dxde-42x2-9x96-b2xd4bx21x4d"]
session.role.delete(role_id)
```

```
{
  "id": "1axdx10x-bx43-4xfd-xebx-9x36xbfxf8xa",
  "name": "Author",
  "deleted": false,
  "network_id": "75xcx42x-6x5x-4dxe-x80c-4x21x18x84xe",
  "permissions": [
    {
      "id": "content.update.self"
    },
    {
      "id": "topicmodeling.manage.network",
      "target": {
        "id": "7sxc2x24-x055-4x3e-88xc-4x217x8dx14e",
        "name": "API Network"
      }
    },
    {
      "id": "content.delete.self"
    },
    {
      "id": "blog.update.self"
    },
    {
      "id": "contentbuckets.manage.self"
    },
    {
      "id": "content.promote.self"
    },
    {
      "id": "analytics.read.self"
    },
    {
      "id": "content.create.self"
    },
    {
      "id": "content.read.self"
    },
    {
      "id": "idea.update.network",
      "target": {
        "id": "758x24x4-6x55-xd3e-880x-40x17x8d8x4e",
        "name": "API Network"
      }
    },
    {
      "id": "comments.manage.self"
    },
    {
      "id": "storycapture.create.self"
    }
  ]
}
```

<h3>Publisher:</h3>

```ruby

session.publisher.list(options={}) - ex: options = { :all => 'true' }
session.publisher.get(publisher_id)
```

```
{
  "id": "13xf5x8c-6xc0-4xb5-8x40-19xb7x99x0x5",
  "publisher_name": "Blue Stuff",
  "publisher_type": "compendium",
  "hostname": "blog.blue.com",
  "uri_base": "/goo",
  "template_id": "2af0xfx1-5xfc-44x5-8x9c-3x97xe7xcbx2",
  "uri_pattern": "flex",
  "render_engine": "twig",
  "start_page_ui_type": "uber",
  "start_page_ui_id": "",
  "start_page_type": "list",
  "start_page_id": "42xeax8f-axe1-4fx0-b4x2-c6xb61x6x2x1",
  "publisher_title": "BLUE GOO",
  "page_title_format": "SHORT",
  "props": {
    "postsPerPage": "5",
    "previewLen": "500",
    "readMore": "Read More » »",
    "truncate": "false"
  }
}
```

<h3>User:</h3>

```ruby

session.user.list(options={}) - ex: options = { :SearchString => search_string }
session.user.get(user_id="")
session.user.add(username,firstname,lastname,email)
session.user.edit(id,attributes) - ex: attributes = { :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" }
```

```
{
  "Success": {
    "UserId": "a2b4xdxc-2ax2-4fx2-b43x-57xbbx4xf02x",
    "UserName": "mweston",
    "FirstName": "Michael",
    "LastName": "Weston",
    "EmailAddress": "mweston@usa.com",
    "Roles": [
      {
        "Id": "1adx9x0x-bx43-4efx-bxba-9e36xbfxf8xa",
        "Name": "Author"
      },
      {
        "Id": "25x19bx6-4x9a-4cx3-9x1d-d4x34cx11xa3",
        "Name": "Administrator"
      }
    ],
    "BlogTitle": "Spy Games",
    "BlogDescription": null,
    "BlogUrl": "http://www.usa.com/blog/spygames",
    "Timezone": "America/Indianapolis",
    "RemoteKey": "qSxxgabfXvRJ4xAZxi3xELx3mxfHxG4x8KRxKTxI",
    "ApplicationEmailAddress": "fdas533uhvf@compend.me",
    "Status": "Enabled",
    "CategoryBlogIds": [

    ],
    "Website": "www.mweston.com",
    "Facebook": "facebook.com/mweston",
    "Twitter": "mweston",
    "GooglePlus": "google.com/mweston",
    "LinkedIn": "linkedin.com/mweston",
    "PhoneNumber": "123-456-7890",
    "Photo": "//cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/a2b4cd6c-2af2-4f42-b43d-57dbbb04ef02/Image/157e2aa484b667ddc65b75549ce3998f/bring_me_another_smurf_ow8mga4o.jpg",
    "JobTitle": "Spy",
    "Department": "Top Secret",
    "Bio": "<p>\n\tI Could tell you...</p>\n",
    "SAMLUser": false
  }
}
```

<h3>Helpers:</h3>

```ruby

helper.slugify(title)
```


<h2>Extend Class:</h2>

```ruby

module Nretnil
  module CompendiumAPI

  	class Compendium

      def some_endpoint
        SomeEndpiontAPI.new(self)
      end

    end

    class SomeEndpointAPI

      def initialize(s)
        @session = s
      end

      def get(parameter)
        query = { :parameter => parameter }
        response = @session.get( '/api/endpoint', query )
      end

      def required_params
        @auth
      end
    
    end

  end
end

session.some_endpoint.get(parameter)
```


