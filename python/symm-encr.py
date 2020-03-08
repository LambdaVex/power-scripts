def save_file(results, file_path):
    # Create File Object
    f = open (file_path, 'w')
    # Write Results
    f.write (results)
    # Close File Object
    f.close ()


def open_file(file_path):
    # Create File Object
    f = open (file_path, 'r')
    # Read File Contents
    file_contents = f.read ()
    # Close File Object
    f.close ()

    return file_contents


def calculate_key(key):
    results = 0
    counter = 0
    # Convert each Character into an INT and added to results
    for char in key:
        counter += 1
        results += ord (char)

    # Return the results divided by the number of Characters in the key
    return int (results / counter)


def decrypt(file_path, key):
    # Get Encrypted Text data
    file_contents = open_file (file_path)
    # Calculate the Key
    key_calc = calculate_key (key)
    dec_results = ''

    for line in file_contents:
        for wrd in line:
            for char in wrd:
                # Subtract from the Key Results
                int_char = ord (char) - key_calc
                # Append Results
                dec_results += chr (int_char)

    save_file (dec_results, file_path)
    print '[!] Finished Decryption'


def encrypt(file_path, key):
    # Get Clear Text data
    file_contents = open_file (file_path)
    # Calculate the Key
    key_calc = calculate_key (key)
    enc_results = ''

    for line in file_contents:
        for wrd in line:
            for char in wrd:
                # Add to the Key Results
                int_char = ord (char) + key_calc
                enc_results += chr (int_char)

    save_file (enc_results, file_path)
    print '[!] Finished Encryption'


def main():
    print 'Please Choose One Of The Following:\n 1]Encrypt\n 2]Decrypt'
    choice = raw_input ('>')
    print 'Enter the File Path'
    file_path = raw_input ('>')
    print 'Enter the Secret Key'
    key = raw_input ('>')
    # Encrypt
    if choice == "1":
        encrypt (file_path, key)
    # Decrypt
    elif choice == "2":
        decrypt (file_path, key)

    else:
        print 'Invalid Choice'


if __name__ == '__main__':
    main ()
