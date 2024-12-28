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

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: i32) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let d = line.unwrap().parse::<T>().unwrap();
        col.push(d);
    });
    col
}

fn binary_search(v: &Vec<i32>, n: i32) -> String {
    let mut l = 0;
    let mut r = v.len();

    while l < r {
        let m = (l + r) / 2;
        if v[m] == n {
            return "Yes".to_string();
        } else if v[m] < n {
            l = m + 1;
        } else {
            r = m;
        }
    }
    return "No".to_string();
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());
    let q = read_col_vec::<i32>(&mut reader.lock(), n);

    for n in q {
        println!("{}", binary_search(&v, n));
    }
}
