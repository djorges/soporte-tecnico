import os

directory = "/path/to/files/"

for filename in os.listdir(directory):
   
   new_filename = "prefix_" + filename

   os.rename(os.path.join(directory, filename), os.path.join(directory, new_filename))

print("Files have been renamed.")