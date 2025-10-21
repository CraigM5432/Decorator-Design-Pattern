class SimpleWriter
    def initialize(path)
        @file = File.open(path, "w")
    end 

    def write_line(line)
        @file.print(line)
        @file.print("\n")
    end 

    def close
        @file.close
    end
end 

class WriterDecorator
    def initialize(real_writer)
        @real_writer = real_writer
    end 

    def write_line(line)
        @real_writer.write_line(line)
    end 

    def close
        @real_writer.close
    end

end 

class NumberingWriter < WriterDecorator
    def initialize(real_writer) # constructor
        super(real_writer)
        @line_number = 1
    end 

    def write_line(line)
        @real_writer.write_line("#{@line_number}: #{line}") # add line number
        line_number = 1
    end 

    def close 
        @real_writer.close # call the real writer close method
    end   
end 

class TimeStampWriter < WriterDecorator 
    def write_line(line)
        @real_writer.write_line("#{Time.new}: #{line}") # add timestamp
    end 
end  

writer = NumberingWriter.new(TimeStampWriter.new(SimpleWriter.new("output.txt"))) # compose decorators
writer.write_line("Hello World")
writer.write_line("Testing Decorator Pattern")
writer.close

writer = NumberingWriter.new(SimpleWriter.new("other_output.txt")) # compose decorators
writer.write_line("Creating another file")
writer.write_line("Without the Time Stamp Decorator this time round")
writer.write_line("Again, demonstrating the decorator pattern")
writer.close

writer = NumberingWriter.new(TimeStampWriter.new(SimpleWriter.new("another_another_output.txt"))) # compose decorators
writer.write_line("Another file")
writer.write_line("Again, with both writing")
writer.write_line("Numbering & Time Stamps")
writer.close

writer = TimeStampWriter.new(SimpleWriter.new("time_output.txt")) # compose decorators
writer.write_line("Time Line: ")
writer.write_line("another line: ")
write.close()

