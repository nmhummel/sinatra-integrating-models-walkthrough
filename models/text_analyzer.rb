# Your TextAnalyzer model code will go here.
class TextAnalyzer
    attr_reader :text
  
    def initialize(text)
      @text = text.downcase
    end
  
    def count_of_words
      words = text.split(" ")
      words.count
    end
  
    def count_of_vowels
      text.scan(/[aeoui]/).count
    end
  
    def count_of_consonants
      text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
    end
  
    def most_used_letter
      s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces  theraininspain
      arr = s1.split('') # t,h,e,r,a,i,n,i,n,s,p,a,i,n
      arr1 = arr.uniq  # t,h,e,r,a,i,n,s,p
      arr2 = {} # empty
  
      arr1.map do |c| # t,h,e,r,a,i,n,s,p - goes through and collects
        arr2[c] =  arr.count(c) # arr2[t] = count of t in original array (1), h=1, e=1, r=1, a=2, i=3, n=3, s=1, p=1
      end # result would be hash? arr2 = {t:1, h:1, e:1, r:1, a:2, i:3, n:3, s:1, p:1}
  
      biggest = { arr2.keys.first => arr2.values.first } # t: 1
  
      arr2.each do |key, value| # arr2 = {t:1, h:1, e:1, r:1, a:2, i:3, n:3, s:1, p:1}
        if value > biggest.values.first # if value(1,2,3) > 1, then 2, then 3
          biggest = {} # empty hash
          biggest[key] = value # add k:v to empty hash, then loop till only biggest remains
        end
      end
  
      biggest # returns the hash of most used letter
    end
  end 