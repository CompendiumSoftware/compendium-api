module Nretnil
  module CompendiumAPI

    class Compendium

      def content_group
        ContentGroupAPI.new(self)
      end

    end

    class ContentGroupAPI

      def initialize(s)
        @session = s
      end

      def list
        query = {}
        response = @session.get( '/api/content_groups', query )
      end

      def get(id)
        query = {}
        response = @session.get( '/api/content_groups/' + id, query )
      end
      
      def add(name,config = {})
        default_config = { "content_width" => 500, "character_limit" => 300, "wide_thumbnail_height" => 200, "side_thumbnail_height" => 150, "side_thumbnail_width" => 150, "read_more_text" => "Continue Reading", "read_more_color" => "#000000", "body_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 13, "color" => "#000000" }, "title_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 20, "color" => "#000000"}, "byline_settings" => { "author" => false, "author_title" => false, "date" => false, "italic" => true, "size" => 12 }, "include_social_buttons" => true }
        new_config = config.merge(default_config)
        body = { :name => name, :config => new_config }
        response = @session.post( '/api/content_groups', body.to_json, {} )
      end

      def add_item(id,content)
        body = { :items => content }
        response = @session.post( '/api/content_groups/' + id + '/items', body.to_json, {} )
      end

      def edit(id,config)
        body = { :config => config }
        response = @session.put( '/api/content_groups/' + id, body.to_json )
      end

      def edit_item(group_id, item_id, config)
        body = { :config => config }
        response = @session.put( '/api/content_groups/' + group_id + '/items/' + item_id, body.to_json )
      end

      def delete(group_id)
        response = @session.delete( '/api/content_groups/' + group_id )
      end

      def required_params
        @auth
      end
    
    end

  end
end