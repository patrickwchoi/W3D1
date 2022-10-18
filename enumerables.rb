class Array
    def my_each(&prc)
        i=0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
        # self.map! {|el| prc.call(el)} #not sure why this works, but its whatever
        # self
    end
    def my_select(&prc)
        self.select {|el| prc.call(el)}
        # i=0
        # ans = []
        # while i < self.length
        #     ans<<self[i] if prc.call(self[i])
        #     i+=1
        # end
        # ans
    end
    def my_reject(&prc)
        self.select {|el| !prc.call(el)}
    end
    def my_any?(&prc)
        self.any? {|el| prc.call(el)}
    end
    def my_all?(&prc)
        self.all? {|el| prc.call(el)}
    end

    def my_flatten
        if !self.first.kind_of?(Array) && self.length==1
            return [self]
        elsif self.first.kind_of?(Array)
            return self.first.my_flatten + self.drop.my_flatten
        elsif self.length==1
            return self[0].my_flatten #I need this to remove a nested array
        else
            return self[0].my_flatten + self[1...self.length].my_flatten
        end
    end
    def my_zip(*args)
        ans=[]
        self.each_with_index do |el, i|
            temp = [el]
            args.each_with_index do |arg, j|
                temp << args[j][i]
            end
            ans << temp
        end
        ans
    end
    def my_rotate(rotate=1)
        ans=self.dup #shallow copy
        if rotate>0
            (0...rotate).each do |i|
                temp = ans.first
                ans.shift
                ans << temp
            end
        else 
            rotate = -rotate
            (0...rotate).each do |i|
                temp = ans.last
                ans.pop
                ans.unshift(temp)
            end
        end
        ans
    end
    def my_join(sep = '')
        self.join(sep)
    end
    def my_reverse
        self.reverse
    end
    def factors(num)
        self.select {|el| num % el==0}
    end
    def substrings(string)
        ans=[]
        self.each do |el|
            if string.include?(el)
                ans << el
            end
        end
        ans
    end

end 


p [1,2,3,4].factors(8)