#!/usr/bin/ruby

# file: dynarex-usersblog.rb

require 'dynarex-blog'
require 'fileutils'

class DynarexUsersBlog

  def initialize(user='')

    unless user.empty? then
      @current_user = user
      
      user_file_path = 'users/' + @current_user
      FileUtils.mkdir_p user_file_path

      @user_blog = DynarexBlog.new user_file_path
      @current_blog = @user_blog
    end

    @master_blog = DynarexBlog.new

    super()
  end

  def create_entry(blog_params={})
    blog_params.merge!({user: @current_user})
    @user_blog.create_entry blog_params
    @master_blog.id = @user_blog.id.to_i - 1
    @master_blog.create_entry blog_params
  end

  def delete(id=0)
    @user_blog.delete id
    @master_blog.delete id
  end

  def page(n)
    @master_blog.page(n)
  end

  def tag(tag_name)
    @master_blog.tag(tag_name)
  end

  def user(user_name)
    user_file_path = 'users/' + user_name
    DynarexBlog.new(user_file_path)
  end
  
end

