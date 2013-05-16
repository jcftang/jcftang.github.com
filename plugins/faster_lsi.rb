module Jekyll
  class Post
   def related_posts(posts)
      return [] unless posts.size > 1

      if self.site.lsi
        self.class.lsi ||= begin
          puts "Starting the classifier..."
          lsi = Classifier::LSI.new :auto_rebuild => false
          $stdout.print("  Populating LSI... ");$stdout.flush
          posts.each { |x| $stdout.print(".");$stdout.flush;lsi.add_item(x) }
          $stdout.print("\n  Rebuilding LSI index... ")
          lsi.build_index
          puts ""
          lsi
        end

        related = self.class.lsi.find_related(self.content, 11)
        related - [self]
      else
        (posts - [self])[0..9]
      end
    end
  end
end
