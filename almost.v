module almost

@[params]
pub struct AlmostConfig {
pub:
	absolute f64 = 1.7763568394002505e-15
	relative f64 = 1.7763568394002505e-15
}

@[inline]
pub fn equal(a f64, b f64, config AlmostConfig) bool {
	if a == b {
		return true
	}
	diff := f64_abs(a - b)
	if diff <= config.absolute {
		return true
	}
	abs_a := f64_abs(a)
	abs_b := f64_abs(b)
	mut err := f64(0)
	if abs_a < abs_b {
		err = diff / abs_b
	} else {
		err = diff / abs_a
	}
	return err <= config.relative
}
