require 'launchy'

STUDENTS = [
  "http://fullimmersion.me/",
  "http://sleepydinosuar.tumblr.com/",
  "http://keturahwalters.blogspot.com/",
  "http://breuklenboy.tumblr.com/",
  "http://codewardbound.tumblr.com/",
  "http://github.com/MrSnickers/Blog",
  "http://chryus.wordpress.com/",
  "http://nikkicodes.tumblr.com/",
  "http://sarahunderstandsverylittle.tumblr.com/",
  "http://anunorderedlistapart.tumblr.com/",
  "http://gustavocguimaraes.wordpress.com/",
  "http://katepdonahue.tumblr.com/",
  "http://lewisjp.blog.com/",
  "http://nishacodes.tumblr.com/",
  "http://mykindofgeek.com/"
]

Launchy.open("#{STUDENTS.sample}")
