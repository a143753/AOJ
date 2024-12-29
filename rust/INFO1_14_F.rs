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

fn binary_search(v: &Vec<i32>, n: i32) -> Vec<i32> {
    let mut l = 0;
    let mut r = v.len();
    let mut ret = Vec::new();
    while l < r {
        let m = (l + r) / 2;
        ret.push(v[m]);
        if v[m] == n {
            break;
        } else if v[m] < n {
            l = m + 1;
        } else {
            r = m;
        }
    }
    ret
}

fn linear_search(v: &Vec<i32>, n: i32) -> Vec<i32> {
    let mut ret = Vec::new();
    for x in v {
        ret.push(x.clone());
        if *x == n {
            break;
        }
    }
    ret
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());

    let l = linear_search(&v, n);
    let b = binary_search(&v, n);

    println!(
        "{}",
        l.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(" ")
    );
    println!(
        "{}",
        b.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(" ")
    );
}
