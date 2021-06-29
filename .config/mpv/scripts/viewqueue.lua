function os.capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  output = string.gsub(
        string.gsub(
            string.gsub(s, '^%s+', ''), 
            '%s+$', 
            ''
        ), 
        '[\n\r]+',
        '\n{\\fs10}'
  )
  return output
end

toggle = false
assdraw = mp.create_osd_overlay("ass-events")

function main()
    if not toggle then
        assdraw.data = "{\\fs10}" .. os.capture("~/bin/viewqueue")
        assdraw:update()
        toggle = not toggle
    else
        assdraw:remove()
        toggle = not toggle
    end

    
end

mp.add_key_binding("l", "viewqueue", main)
