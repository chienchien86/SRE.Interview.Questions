import re


def read_file(file_path):
    """Read the file and convert it to lowercase text"""
    with open(file_path, 'r') as file:
        return file.read().lower()


def extract_words(text):
    """Use regular expressions"""
    return re.findall(r'\b[a-zA-Z0-9]+\b', text)


def count_word_frequency(words):
    """Count the occurrences of each word"""
    word_counts = {}
    for word in words:
        word_counts[word] = word_counts.get(word, 0) + 1
    return word_counts


def find_most_common_word(word_counts):
    """Find the most frequent word"""
    return max(word_counts, key=word_counts.get), word_counts[max(word_counts, key=word_counts.get)]


def main(file_path):
    text = read_file(file_path)
    words = extract_words(text)
    word_counts = count_word_frequency(words)
    most_common_word, count = find_most_common_word(word_counts)
    print(f"{count} {most_common_word}")



if __name__ == "__main__":
    main("words.txt")
