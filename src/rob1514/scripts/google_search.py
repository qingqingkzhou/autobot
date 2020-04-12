#!/usr/bin/env python

# https://github.com/abenassi/Google-Search-API
from google import google


def get_search_result(words, num_page):
    search_results = google.search(words, num_page)
    results = []
    for result in search_results:
        results.append(result.description)

    return results


words = "I, afraid, i'm, i'm, sorry, that, can't, Dave, I'm, do"
print(get_search_result(words, 3))