def qsort(a, left, right)
	l = left; r = right
	pv = l
	while 1
		while a[l] < a[pv]; l++; end
		while a[pv] < a[r]; r--; end
		if l >= r break end
		t = a[l]; a[l] = a[r]; a[r] = t;
		l++; r--
	end
	if left < l - 1
		qsort(a, left, l - 1)
	end
	if r + 1 < right
		qsort(a, r + 1, right)
	end
end

max = 20
a = Array(max)

for i = 0, i < max, i++
	printf "%c ", a[i] = 'A' + rand() % ('Z' - 'A')
end; puts ""

qsort(a, 0, max - 1)

for i = 0, i < max, i++
	printf "%c ", a[i]
end; puts ""
