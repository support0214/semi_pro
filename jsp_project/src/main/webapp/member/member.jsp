<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <script src="../resource/js/script.js" type="text/javascript" charset="utf-8"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function findAddr() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        let roadAddr = data.roadAddress;
                        let jibunAddr = data.jibunAddress;
                        let extraAddr = '';

                        document.getElementById("postcode").value = data.zonecode;
                        if (data.userSelectedType == 'R') {
                            if (roadAddr != '') {
                                if (data.bname != '') {
                                    extraAddr += data.bname;
                                }
                                if (data.buildingName != '') {
                                    extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName;
                                }
                                roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
                                document.getElementById("addr").value = roadAddr;
                            }
                        } else if (data.userSelectedType == 'J') {
                            document.getElementById("addr").value = jibunAddr;
                        }
                        document.getElementById("detailAddr").focus();
                    }
                }).open();
            }
        </script>
    </head>

    <body>
        <!-- <form method="post" action="memberProc.jsp" name="regFrm">
            <table border="1" align="center" style="background-color: beige;">
                <tr>
                    <th colspan="3" align="center">회원가입</th>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="id" onkeydown="inputIdChk();">
                        <input type="button" name="idc" value="ID중복확인" onclick="idCheck(this.form.id.value);">
                        <input type="hidden" name="idbtncheck" value="idUncheck">
                    </td>
                    <td>영문과 숫자로만 입력</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pwd"></td>
                    <td>특수기호, 영문, 숫자가 각 1개 이상</td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="repwd"></td>
                    <td>위의 비밀번호를 한버 더 입력</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name"></td>
                    <td>한글로 입력</td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td><input type="radio" name="gender" value="1">남&emsp;&emsp;<input type="radio" name="gender"
                            value="2">여</td>
                    <td>성별을 선택해주세요</td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="text" name="birthday"></td>
                    <td>6글자로 입력 Ex) 101010</td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="email" name="email" size="30"></td>
                    <td>Ex) kh@naver.com</td>
                </tr>
                <tr>
                    <td>우편번호</td> <!--  다음 주소api 사용 -->
        <!-- <td>
                        <input type="text" name="zipcode" id="postcode" readonly>
                        <input type="button" value="우편번호 찾기" onclick="findAddr();">
                    </td>
                    <td>우편번호 입력</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" size="45px" name="address" id="addr"><br>
                        <input type="text" name="detailAddress" id="detailAddr">
                    </td>
                    <td>상세주소가 있으면 입력해주세요</td>
                </tr>
                <tr>
                    <td>취미</td>
                    <td>
                        <input type="checkbox" name="hobby" value="인터넷">인터넷
                        <input type="checkbox" name="hobby" value="여행">여행
                        <input type="checkbox" name="hobby" value="게임">게임
                        <input type="checkbox" name="hobby" value="영화">영화
                        <input type="checkbox" name="hobby" value="운동">운동
                    </td>
                    <td>취미를 선택하세요</td>
                </tr>
                <tr>
                    <td>직업</td>
                    <td>
                        <select name="job">
                            <option value="@" selected>선택하세요
                            <option value="개발자">개발자
                            <option value="운동선수">운동선수
                            <option value="변호사">변호사
                            <option value="의사">의사
                            <option value="포토그래퍼">포토그래퍼
                            <option value="작가">작가
                            <option value="자영업자">자영업자
                        </select>
                    </td>
                    <td>직업을 선택하세요</td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="button" value="회원가입" onclick="inputCheck();">&emsp;
                        <input type="reset" value="다시쓰기">&emsp;
                        <input type="button" value="로그인" onclick="location.href='login.jsp'">
                    </td>
                </tr>
            </table>
        </form> -->


        <form method="post" action="memberProc.jsp" name="regFrm">
            <section class="signUp">
                <h2>회원가입</h2>
                <ul>
                    <li>
                        <input type="text" name="id" onkeydown="inputIdChk();" placeholder="영문/숫자로 입력"
                            style="width: 300px; height: 30px;">
                        <input type="button" name="idc" value="ID중복확인" onclick="idCheck(this.form.id.value);"
                            style="border: 0 solid; width: 95px; height: 35px; background-color: gainsboro;">
                        <input type="hidden" name="idbtncheck" value="idUncheck">

                    </li>
                    <li>
                        <input type="password" name="pwd" required style="width: 300px; height: 30px;"
                            placeholder="특수기호, 영문, 숫자 각 1개이상 입력">
                    </li>

                    <li>
                        <input type="password" name="repwd" style="width: 300px; height: 30px;" placeholder="비밀번호 재입력">
                    </li>
                    <li>
                        <input type="text" name="name" style="width: 300px; height: 30px;" placeholder="이름 입력">
                    </li>
                    <li><input type="radio" name="gender" value="1">남<input type="radio" name="gender" value="2">여</li>
                    <li><input type="text" name="birthday" style="width: 300px; height: 30px;"
                            placeholder="생년월일 입력 Ex) 101010"></li>
                    <li><input type="email" name="email" style="width: 300px; height: 30px;"
                            placeholder="Ex) kh@kh.com"></li>
                    <li>
                        <input type="text" name="zipcode" id="postcode" readonly style="width: 150px; height: 30px;">
                        <input type="button" value="우편번호 찾기" onclick="findAddr();"
                            style="border: 0 solid; width: 150px; height: 35px; background-color: gainsboro">
                    </li>

                    <li><input type="text" name="address" id="addr" style="width: 300px; height: 30px;"></li>
                    <li><input type="text" name="detailAddress" id="detailAddr" placeholder="상세주소 입력"
                            style="width: 300px; height: 30px;"></li>
                    <li>
                        취미선택 :
                        <select name="hobby">
                        	<option value="@" selected>선택하세요
                        	<option value="인터넷">인터넷
                            <option value="운동선수">여행
                            <option value="변호사">게임
                            <option value="의사">영화
                            <option value="포토그래퍼">운동
<!--                             
                        	<input type="checkbox" name="hobby" value="인터넷">인터넷
                        	<input type="checkbox" name="hobby" value="여행">여행
                        	<input type="checkbox" name="hobby" value="게임">게임
                        	<input type="checkbox" name="hobby" value="영화">영화
                        	<input type="checkbox" name="hobby" value="운동">운동 -->
                        </select>
                        
                    </li>
                    <li>
                        직업선택 :
                        <select name="job">
                            <option value="@" selected>선택하세요
                            <option value="개발자">개발자
                            <option value="운동선수">운동선수
                            <option value="변호사">변호사
                            <option value="의사">의사
                            <option value="포토그래퍼">포토그래퍼
                            <option value="작가">작가
                            <option value="자영업자">자영업자
                        </select>
                    </li>
                    <div>
                        <li>
                            <input type="button" value="회원가입" onclick="inputCheck();" class="etc">
                            <input type="reset" value="다시쓰기" class="etc">
                            <input type="button" value="로그인" onclick="location.href='login.jsp'" class="etc">
                        </li>
                    </div>
                </ul>
            </section>
        </form>
    </body>
    <style>
        .signUp {
            width: 410px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        ul {
            list-style: none;
            padding-left: 0px;
        }

        .signUp h2 {
            font-size: 32px;
            color: #111;
            border-bottom: 2px solid #111;
            text-align: center;
            line-height: 1;
            padding-bottom: 20px;
        }

        .signUp li {
            padding: 0 0 12px;
        }

        .signUp li input {
            height: 20px;
        }
        div {text-align: center; display: flex; justify-content: space-around; flex-direction: row;
	box-sizing: border-box;}
        .etc {border: 0 none; font-size: 16px; width: 100px; background-color: transparent;}
    </style>

    </html>