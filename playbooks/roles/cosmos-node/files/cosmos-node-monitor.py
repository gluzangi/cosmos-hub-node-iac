import os
 
#
# printing environment variables
#

# print(os.environ)

for k, v in os.environ.items():
    print(f'{k}={v}')
