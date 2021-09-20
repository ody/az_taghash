Facter.add(:az_tagshash) do
 confine :az_metadata do |value|
   value.nil? == false
 end

 setcode do 
   Facter.value(:az_metadata)['compute']['tagsList'].reduce({}) do |h,i|
     h.merge!({ i['name'] => i['value'] })
   end
 end
end
