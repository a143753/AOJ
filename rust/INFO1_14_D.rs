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

fn binary_search(v: Vec<i32>, n: i32) {
    let mut l = 0;
    let mut r = v.len();

    while l < r {
        let m = (l + r) / 2;
        // lとrの間にspaceを入れなかったためWrong Answerになっていた。
        println!("[{}, {})", l, r);
        if v[m] == n {
            return;
        } else if v[m] < n {
            l = m + 1;
        } else {
            r = m;
        }
    }
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());
    binary_search(v, n);
}
