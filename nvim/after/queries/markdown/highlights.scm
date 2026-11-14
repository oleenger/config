; extends
; Capture the '#' markers separately so lua/notes can dim them; the heading text
; keeps its @markup.heading.N colour.
[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
] @markup.heading.marker
