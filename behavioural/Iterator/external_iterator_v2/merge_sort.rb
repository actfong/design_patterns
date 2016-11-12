require_relative "./bike_repo_v2"

# Merge sorted collections
def merge_sort(collection_1, collection_2)
  iterator1 = Iterator.new(collection_1)
  iterator2 = Iterator.new(collection_2)

  merged = []
  while iterator1.has_next? && iterator2.has_next?
    if iterator1.item < iterator2.item
      merged << iterator1.next
    else
      merged << iterator2.next
    end
  end

  while iterator1.has_next?
    merged << iterator1.next
  end
  while iterator2.has_next?
    merged << iterator2.next
  end
  merged
end
