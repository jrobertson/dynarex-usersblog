#!/usr/bin/ruby

# file: dynarex-usersblog.rb

require 'dynarex-blog'
require 'fileutils'
require 'hashcache'

class DynarexUsersBlog

  def initialize(file_path='.', user='')

    threads = []
    threads << Thread.new{
      unless user.empty? then      
        @current_user = user      
        @file_path = file_path      
        user_file_path = "%s/users/%s" % [@file_path,  @current_user]

        FileUtils.mkdir_p user_file_path
        @hc_blog = HashCache.new
	switch_user user
      end
    }

    threads << Thread.new{@master_blog = DynarexBlog.new file_path}
    threads.each{|thread| thread.join}
    
    super()
  end

  def create_entry(blog_params={}, user='')
    switch_user user unless user.empty? or @current_user == user
    blog_params.merge!({user: @current_user})
    @user_blog.create_entry blog_params
    @master_blog.id = @user_blog.id.to_i - 1
    @master_blog.create_entry blog_params
  end

  def delete(id=0)
    @user_blog.delete id
    @master_blog.delete id
  end

  def page(n=0)
    @master_blog.page(n)
  end

  def tag(tag_name)
    @master_blog.tag(tag_name)
  end

  def user(username)
    (@current_user == username ? @current_user : switch_user(username))
  end
  
  def entry(id)
    @master_blog.entry(id)
  end
  
  def tags
    @master_blog.tags
  end
  
  def update_user(user, id=0, h={})
    switch_user user unless @current_user == user
    @user_blog.update(id, h)
    @master_blog.update(id, h)
  end
  
  def switch_user(user)
    user_file_path = "%s/users/%s" % [@file_path,  user]
    @user_blog = @hc_blog.read(user) { DynarexBlog.new user_file_path }
    @current_blog = @user_blog
  end
  
end

