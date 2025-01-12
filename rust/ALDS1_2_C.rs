use std::collections::HashMap;
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

fn bubble_sort(v: &mut Vec<(String, i32)>) -> i32 {
    let n = v.len();
    let mut s = 0;
    let mut flag = true;
    while flag {
        flag = false;
        for j in (1..n).rev() {
            if v[j].1 < v[j - 1].1 {
                v.swap(j, j - 1);
                flag = true;
                s += 1;
            }
        }
    }
    s
}

fn selection_sort(v: &mut Vec<(String, i32)>) -> i32 {
    let n = v.len();
    let mut s = 0;

    for i in 0..n {
        let mut minj = i;
        for j in i..n {
            if v[j].1 < v[minj].1 {
                minj = j;
            }
        }
        if i != minj {
            v.swap(i, minj);
            s += 1;
        }
    }
    s
}

fn cnv(v0: Vec<String>) -> Vec<(String, i32)> {
    let mut v = Vec::new();

    v0.iter().for_each(|x| {
        let s = x[0..1].to_string();
        let n = x[1..].parse::<i32>().unwrap();
        v.push((s, n));
    });
    v
}

fn pack(v: &Vec<(String, i32)>) -> HashMap<i32, Vec<String>> {
    let mut m = HashMap::new();
    v.iter().for_each(|x| {
        let c = x.0.clone();
        let n = x.1;
        m.entry(n).or_insert(Vec::new()).push(c);
    });
    m
}

fn join(v: &Vec<(String, i32)>) -> String {
    v.iter()
        .map(|x| x.0.clone() + &x.1.to_string())
        .collect::<Vec<_>>()
        .join(" ")
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v0 = read_row_vec::<String>(&mut reader.lock());
    let v = cnv(v0);
    let mut vb = v.clone();
    let mut vs = v.clone();

    let _sb = bubble_sort(&mut vb);
    let _ss = selection_sort(&mut vs);

    let mv = pack(&v);
    let mb = pack(&vb);
    let ms = pack(&vs);

    println!("{}", join(&vb));
    if mv == mb {
        println!("Stable");
    } else {
        println!("Not stable");
    }
    println!("{}", join(&vs));
    if mv == ms {
        println!("Stable");
    } else {
        println!("Not stable");
    }
}
