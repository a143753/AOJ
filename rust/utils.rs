// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。

// #### 出力
// - T:
// - 読み取った1行のデータを指定された型 T にパースした結果を返します。

// #### 詳細
// 1. 標準入力から1行を読み取ります。
// 2. 読み取った行全体を型 T にパースします。
// 3. パースされた値を返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。
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

// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。

// #### 出力
// - Vec<T>:
// - 読み取った1行のデータを、空白で分割し、指定された型 T にパースした結果をベクターとして返します。

// #### 詳細
// 1. 標準入力から1行を読み取ります。
// 2. 読み取った行を空白で分割します。
// 3. 分割された各要素を型 T にパースします。
// 4. パースされた要素をベクターに収集し、そのベクターを返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。

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

// 入力
// - reader: 標準入力 (std::io::StdinLock) の参照。これは入力を読み取るためのロックされた標準入力ストリームです。
// - n: 読み取る行数を指定する整数 (usize)。

// ### 出力
// - Vec<T>: 読み取ったデータを格納するベクター。各行のデータは型 T にパースされます。

// ### 詳細な説明
// 1. 関数はまず空のベクター col を作成します。
// 2. reader から n 行を読み取り、それぞれの行を文字列として取得します。
// 3. 各行の文字列を型 T にパースし、パースに成功したデータをベクター col に追加します。
// 4. 最終的に、すべてのデータが格納されたベクター col を返します。

// ### 注意点
// - 型 T は std::str::FromStr トレイトを実装している必要があります。つまり、文字列から型 T に変換できる必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。
fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

// 入力
// - reader: &mut std::io::StdinLock:
// - 標準入力のロックされたハンドルを受け取ります。このハンドルを使って標準入力からデータを読み取ります。
// - n: usize:
// - 読み取る行数を指定します。

// #### 出力
// - Vec<Vec<T>>:
// - 読み取った複数行のデータを、各行ごとに空白で分割し、指定された型 T にパースした結果を2次元ベクターとして返します。

// #### 詳細
// 1. 標準入力から指定された行数 n を読み取ります。
// 2. 各行を空白で分割します。
// 3. 分割された各要素を型 T にパースします。
// 4. パースされた要素をベクターに収集し、そのベクターを2次元ベクターに追加します。
// 5. 最終的に2次元ベクターを返します。

// #### 制約
// - 型 T は std::str::FromStr トレイトを実装している必要があります。
// - パースに失敗した場合は unwrap によりパニックが発生します。

fn read_matrix<T: std::str::FromStr>(
    reader: &mut std::io::StdinLock,
    n: usize,
    s: char,
) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    fn sub<T: std::str::FromStr>(line: &str, s: char) -> Vec<T>
    where
        <T as FromStr>::Err: std::fmt::Debug,
    {
        if s == ' ' {
            line.split_whitespace()
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        } else {
            line.split(s)
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        }
    }

    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    }
    matrix
}

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

// エラトステネスの篩
fn primes(n: i32) -> Vec<i32> {
    let mut t: Vec<i32> = (2..n).collect();
    let nn = n as usize;

    for p in 2..nn {
        if t[p - 2] != 0 {
            let mut q = p * 2;
            while q < nn {
                t[q - 2] = 0;
                q += p;
            }
        }
    }
    t.into_iter().filter(|&x| x != 0).collect()
}
fn is_prime(n: i32) -> bool {
    if n < 2 {
        return false;
    } else if n == 2 {
        return true;
    } else if n % 2 == 0 {
        return false;
    } else {
        let nn = (n as f64).sqrt() as i32;
        let mut i = 3;
        while i <= nn {
            if n % i == 0 {
                return false;
            }
            i += 2;
        }
        return true;
    }
}

fn join(v: &Vec<(String, i32)>) -> String {
    v.iter()
        .map(|x| x.0.clone() + &x.1.to_string())
        .collect::<Vec<_>>()
        .join(" ")
}
fn join(v: &Vec<usize>) -> String {
    v.iter()
        .map(|x| x.to_string())
        .collect::<Vec<_>>()
        .join(" ")
}


fn factorize1(mut n: i64) -> Vec<(i64, i64)> {
	let mut res = Vec::new();
	let mut i = 2;
	while i * i <= n {
		if n % i == 0 {
			let mut cnt = 0;
			while n % i == 0 {
				n /= i;
				cnt += 1;
			}
			res.push((i, cnt));
		}
		i += 1;
	}
	if n != 1 {
		res.push((n, 1));
	}
	res
}

fn values(f:Vec<(i64,i64)>)->Vec<i64>{
	let mut res = Vec::new();
	for (p, _) in f {
		res.push(p);
	}
	res
}
