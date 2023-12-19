use std::cmp::Ordering;

struct Date {
    year: u8,
    month: u8,
    day: u8,
}

impl PartialOrd for Date {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for Date {
    fn cmp(&self, other: &Self) -> Ordering {
        (self.year, self.month, self.day).cmp(&(other.year, other.month, other.day))
    }
}

fn main(birth_date: Date, required_date : pub Date) -> pub bool {
    birth_date <= required_date;
}

#[test]
fn test_main() {

    // Valid: birthdate is older than required date
    let birth_date = Date { year: 1990, month: 1, day: 1 };
    let required_date = Date { year: 1995, month: 5, day: 15 };
    assert(main(birth_date, required_date));

    // Valid: birthdate is same as required date
    let birth_date = Date { year: 2020, month: 1, day: 1 };
    let required_date = Date { year: 2020, month: 1, day: 1 };
    assert(main(birth_date, required_date));

    // Invalid; birthdate is newer than required date
    let birth_date = Date { year: 2020, month: 5, day: 15 };
    let required_date = Date { year: 2020, month: 1, day: 1 };
    assert(!main(birth_date, required_date));
}