use std::collections::VecDeque;
use std::io::BufRead;

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

fn read_seq(reader: &mut std::io::StdinLock, n: usize) -> Vec<(String, i32)> {
    let mut seq = Vec::new();
    reader.lines().take(n).for_each(|line| {
        let bindings = line.unwrap();
        let dt = bindings.split_whitespace().collect::<Vec<_>>();
        seq.push((dt[0].to_string(), dt[1].parse::<i32>().unwrap()));
    });
    seq
}

fn f1(mut seq: VecDeque<(String, i32)>, q: i32) {
    // #10でVec<(String,i32)>を使うとtime limit exceeded 1.25s
    // VecDeque<(String,i32)>を使うと0.04s
    let mut t = 0;
    while !seq.is_empty() {
        let (name, time) = seq.pop_front().unwrap();

        if time <= q {
            t += time;
            println!("{} {}", name, t);
        } else {
            t += q;
            seq.push_back((name, time - q));
        }
    }
}

// fn f2(mut seq: Vec<(String, i32)>, q: i32) {
//     // #10でtime limit exceeded 1.99s
//     // 終わったプロセスを削除しないので走査に時間がかかっているかもしれない。
//     let mut t = 0;
//     let mut idx = 0;
//     let mut cnt = 0;
//     let len = seq.len();

//     loop {
//         let name = &seq[idx].0;
//         let time = &seq[idx].1;

//         if *time == 0 {
//             cnt += 1;
//             if cnt == len {
//                 break;
//             }
//         } else {
//             cnt = 0;

//             if *time <= q {
//                 t += time;
//                 println!("{} {}", name, t);
//                 seq[idx].1 = 0;
//             } else {
//                 t += q;
//                 seq[idx].1 = time - q;
//             }
//         }
//         idx = (idx + 1) % len;
//     }
// }

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

    let nq = read_row_vec::<i32>(&mut reader);
    let n = nq[0] as usize;
    let q = nq[1];

    let seq = read_seq(&mut reader, n);
    let seq2 = seq.into_iter().collect::<VecDeque<_>>();

    f1(seq2, q);
}
