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

fn bubble_sort(v: &mut Vec<i32>) -> i32 {
    let n = v.len();
    let mut s = 0;
    let mut flag = true;
    while flag {
        flag = false;
        for j in (1..n).rev() {
            if v[j] < v[j - 1] {
                v.swap(j, j - 1);
                flag = true;
                s += 1;
            }
        }
    }
    s
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let mut v = read_row_vec::<i32>(&mut reader.lock());
    let s = bubble_sort(&mut v);

    println!(
        "{}",
        v.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(" ")
    );
    println!("{}", s);
}
