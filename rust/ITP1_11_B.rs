use std::io::BufRead;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

fn f(v: Vec<i32>, d: Vec<i32>) -> i32 {
    let mut i0 = 0;
    let mut i1 = 0;
    for (i, x) in v.iter().enumerate() {
        if *x == d[0] {
            i0 = i;
        } else if *x == d[1] {
            i1 = i;
        }
    }
    match (i0, i1) {
        // 上、前
        (0, 1) => v[2],
        (0, 2) => v[4],
        (0, 3) => v[1],
        (0, 4) => v[3],
        (1, 0) => v[3], //
        (1, 2) => v[0], //
        (1, 3) => v[5], //
        (1, 5) => v[2], //
        (2, 0) => v[1], //
        (2, 1) => v[5], //
        (2, 4) => v[0], //
        (2, 5) => v[4], //
        (3, 0) => v[4], //
        (3, 1) => v[0], //
        (3, 4) => v[5], //
        (3, 5) => v[1], //
        (4, 0) => v[2], //
        (4, 2) => v[5], //
        (4, 3) => v[0], //
        (4, 5) => v[3], //
        (5, 1) => v[3],
        (5, 2) => v[1],
        (5, 3) => v[4],
        (5, 4) => v[2],
        _ => 0,
    }
}

fn main() {
    let reader = std::io::stdin();

    let v = read_row_vec::<i32>(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());

    for _ in 0..n {
        let d = read_row_vec::<i32>(&mut reader.lock());
        let a = f(v.clone(), d);
        println!("{}", a);
    }
}
