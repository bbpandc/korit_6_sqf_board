import React from 'react';
import { useQuery, useQueryClient } from 'react-query';
import { Link, useParams } from 'react-router-dom';
import { instance } from '../../../apis/util/instance';
import { css } from '@emotion/react';
/** @jsxImportSource @emotion/react */

const layout = css`
    box-sizing: border-box;
    margin: 50px auto 0px;
    width: 1100px;
`;

const contentBox = css`
    & img {
        width: 100%;
    }
`;

function DetailPage(props) {
    const params = useParams();
    const boardId = params.boardId;
    const queryClient = useQueryClient();
    const userInfoData = queryClient.getQueryData("userInfoQuery");

    const board = useQuery(
        ["boardQuery", boardId],
        async () => {
            return instance.get(`/board/${boardId}`);
        },
        {
            refetchOnWindowFocus: false,
            retry: 0,
            onSuccess: response => {

            },
            onError: error => {
                
            }
        }
    );

    return (
        <div css={layout}>
            <Link to={"/"}><h1>사이트 로고</h1></Link>
            {
                board.isLoading && <></>
            }
            {
                board.isError && <h1>{board.error.response.data}</h1>
            }
            {
                board.isSuccess &&
                <>
                    <div>
                        <h1>{board.data.data.title}</h1>
                        <div>
                            <div>
                                <span>
                                    작성자: {board.data.data.writerUsername}
                                </span>
                                <span>
                                    조회수: {board.data.data.viewCount}
                                </span>
                            </div>
                            <div>
                                {
                                    board.data.data.writerId === userInfoData?.data.userId &&
                                    <>
                                        <button>수정</button>
                                        <button>삭제</button>
                                    </>
                                }
                            </div>
                        </div>
                    </div>
                    <div css={contentBox} dangerouslySetInnerHTML={{
                        __html: board.data.data.content
                    }}>
                    </div>
                </>
            }
        </div>
    );
}

export default DetailPage;