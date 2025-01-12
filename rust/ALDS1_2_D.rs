use std::io::{self, BufRead};

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

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
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

fn insertion_sort(v: &mut Vec<i32>, g: usize) -> usize {
    let n = v.len();
    let mut c = 0;
    for i in g..n {
        let mut j = i;
        while j >= g && v[j - g] > v[j] {
            v.swap(j, j - g);
            j -= g;
            c += 1;
        }
    }
    c
}

fn shell_sort(v: &mut Vec<i32>) {
    let n = v.len();
    let mut h = 1;
    let mut m = Vec::new();
    let mut c = 0;

    while h <= n {
        m.push(h);
        h = 3 * h + 1;
    }
    m.reverse();

    for i in 0..m.len() {
        c += insertion_sort(v, m[i]);
    }
    println!("{}", m.len());
    println!("{}", join(&m));
    println!("{}", c);
}

fn join(v: &Vec<usize>) -> String {
    v.iter()
        .map(|x| x.to_string())
        .collect::<Vec<_>>()
        .join(" ")
}

fn main() {
    let reader = io::stdin();
    let mut reader = reader.lock();

    let n = read_row_vec::<usize>(&mut reader)[0];
    let mut v = read_col_vec::<i32>(&mut reader, n as usize);

    shell_sort(&mut v);

    for i in 0..n {
        println!("{}", v[i]);
    }
}
