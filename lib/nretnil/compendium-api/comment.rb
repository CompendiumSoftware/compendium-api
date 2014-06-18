module Nretnil
  module CompendiumAPI

    class Compendium

      def list_comments(options)
        query = options
        response = Compendium.get('/app/comments', :basic_auth => @auth, :query => query, :verify => false )
      end

      def add_comment(post_id, body, time, name, email, url, options)
        data = { :Body => body, :CreatorIpAddress => ip, :CreatorUrl => url, :CreatorEmail => email, :CreatorName => name }
        manditory = { :PostId => post_id, :CommentDataFields => data.to_json, :CreationTimestamp => time }
        query = options.merge(manditory)
        response = Compendium.post('/app/comment', :basic_auth => @auth, :body => query, :verify => false )
      end

      def approve_comments(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "approve", "Notify" => "false"  }
        end
        response = Compendium.post('/app/comments/moderate', :basic_auth => @auth, :body => {:Comments => request.to_json }, :verify => false )
      end

      def decline_comments(comment_ids)
        request = []
        comment_ids.each do |comment_id|
          request << { "CommentId" => comment_id, "Operation" => "decline", "Notify" => "false"  }
        end
        response = Compendium.post('/app/comments/moderate', :basic_auth => @auth, :body => {:Comments => request.to_json }, :verify => false )
      end
    
    end

  end
end