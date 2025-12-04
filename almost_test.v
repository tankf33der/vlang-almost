module almost

fn test_f64_eq_almost() {
	mut a := 3.141592653589793
	mut b := 3.141592653589790
	assert almost.equal(a, b)
	a = 3.141592653589793
	b = 3.141592653589700
	assert almost.equal(a, b, absolute: 1e-10)
	a = 1e-20
	b = 2e-20
	assert almost.equal(a, b)
	assert almost.equal(a, b, absolute: 0, relative: 0) == false
}
