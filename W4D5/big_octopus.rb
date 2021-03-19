

def sluggish_octopus(arr)
    longest = arr[0]
    arr.each do |ele|
       if ele.length > longest.length 
        longest = ele
       end
    end
    longest
end

def dominant_octupus(arr)
    middle_i = arr.length/2 

    left = dominant_octupus(arr[0...middle_i])
    right = dominant_octupus(arr[middle_i..-1])

    merge_help(left, right)
end

def merge_help(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left[0] > right[0]
            sorted << right.shift 
        elsif left[0]< right[0]  
            sorted << left.shift 
        else 
            sorted << left.shift
        end 
    end 
    sorted + left + right 
end


arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(arr)
p dominant_octupus(arr)