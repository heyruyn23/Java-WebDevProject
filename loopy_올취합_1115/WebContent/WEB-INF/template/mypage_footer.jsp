<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div><!--//#myUpload-->
        </div> <!--//#myPage-->

        <div id="sideBar">
            <!-- textarea에 빈 공백이 많이 생겨서 스페이스/엔터값을 주석처리한다 -->
            <div class="introduction"><form action="" method="post"><!--
                --><textarea placeholder="ctrl+Enter시 작성완료" class="editIntro"></textarea><!--
                --><p><%=user.getInfo() %></p></form><!--
            --></div>
            <div class="rankInformation">
                <ul>
                    <li><strong>레벨</strong> <span id="level">57</span></li>
                    <li><strong>랭크</strong> <img src="/img/topaz.png" width="20" height="20"/><span id="rank">토파즈</span></li>
                    <li><strong>배팅</strong> <span id="betting">980</span>dB</li>
                </ul>
            </div><!--//#rankInformation-->
            <div class="settings">
                <ul>
                    <li><a href="">계정관리</a></li>
                    <li<%if(type==8){} %>><a href="/mypage_block.jsp?userNo=<%=user.getNo() %>">차단한 유저 목록</a></li>
                </ul>
            </div><!--//.settings-->
        </div><!--//#sideBar-->
    </div><!--//#content-->
    <div id="top">
        <a href="#"><i class="fas fa-caret-up"></i>top</a>
    </div>