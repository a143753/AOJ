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

fn f(v: Vec<i32>) -> i32 {
    let l = v.len();

    let mut f1 = true;
    let mut f2 = true;
    let mut f3 = true;
    let mut f4 = true;

    (0..l - 1).for_each(|i| {
        if v[i] < v[i + 1] {
            f3 = false;
            f4 = false;
        } else if v[i] == v[i + 1] {
            f1 = false;
            f3 = false;
        } else if v[i] > v[i + 1] {
            f1 = false;
            f2 = false;
        }
    });

    match (f1, f2, f3, f4) {
        (true, _, _, _) => return 2,
        (_, _, true, _) => return -2,
        (_, true, _, true) => return 0,
        (_, true, _, _) => return 1,
        (_, _, _, true) => return -1,
        (_, _, _, _) => return 0,
    }
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());

    println!("{}", f(v));
}
