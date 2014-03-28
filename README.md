# Introducing the dynarex-usersblog gem

The dynarex-usersblog gem is suitable for creating blogs in a multi-user environment.

## Installation

`sudo gem install dynarex-usersblog`

## Example

### Creating a blog entry

    require 'dynarex-usersblog'

    users_blog = DynarexUsersBlog.new 'jrobertson'
    users_blog.create_entry title: "a22brr2", body: "aaa", tags: "aasd fwerf ruby"

### Deleting a blog entry

    users_blog = DynarexUsersBlog.new 'jrobertson'
    users_blog.delete '2'

*update: 24-Jun-2010*

Dynarex-usersblog features user, and tag entry viewing within pages e.g.

    require 'dynarex-usersblog'

    blog = DynarexUsersBlog.new
    puts blog.tag('fwerf').page(1).to_s
    puts blog.user('jrobertson').tag('fwerf').page(1).to_s

## Resources

* [jrobertson's dynarex-usersblog at master](http://github.com/jrobertson/dynarex-usersblog)

