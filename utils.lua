function load_image_gray ( path )
   local img = image.load( path )
   if img:size(1) > 3 then -- rgb + alpha
      img = img[{{1,3},{},{}}]
   end
   if img:size(1) == 2 then -- grayscale + alpha
      img = img[{{1},{},{}}]
   end
   if img:size(1) > 1 then -- rgb -> grayscale
      img = image.rgb2y( img )
   end
   return img
end

function tensor2cvimg( src ) --return byte tensor [0, 255]
	local out = src:clone():permute(2,3,1):mul(255):byte()
	local outc = out[{{},{},{1}}]:clone()
	out[{{},{},{1}}] = out[{{},{},{3}}]
	out[{{},{},{3}}] = outc
	return out
end

function cvimg2tensor( src ) --return float tensor [0, 1]
	local out = src:clone():permute(3,1,2):float():div(255)
	local outc = out[{{1},{},{}}]:clone()
	out[{{1},{},{}}] = out[{{3},{},{}}]
	out[{{3},{},{}}] = outc
	return out
end
