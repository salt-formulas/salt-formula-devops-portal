def iter_items(keys, dict):
    """Iterator over keys and yeilds items from dict.

    Iterates over keys and yeilds tuples of a key and a value only if key is
    presented in dict.

    :param keys: A list of keys to iterate over.
    :param dict: A dict to iterate over.
    """
    for key in keys:
        if key in dict:
            yield (key, dict[key])
