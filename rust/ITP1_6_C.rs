fn output(ap: &Vec<Vec<Vec<i32>>>) {
    for (i, a) in ap.iter().enumerate() {
        for b in a.iter() {
            for c in b.iter() {
                print!(" {}", c);
            }
            println!();
        }
        if i != ap.len() - 1 {
            println!("####################");
        }
    }
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let n = buf.trim().parse::<i32>().unwrap();

    let mut ap = vec![vec![vec![0; 10]; 3]; 4];

    for _ in 0..n {
        let mut buf = String::new();
        std::io::stdin().read_line(&mut buf).unwrap();
        let d = buf
            .trim()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();

        let b = d[0] as usize; // 棟
        let f = d[1] as usize; // 階
        let r = d[2] as usize; // 部屋
        let v = d[3] as i32; // 人数

        ap[b - 1][f - 1][r - 1] += v;
    }

    output(&ap);
}
