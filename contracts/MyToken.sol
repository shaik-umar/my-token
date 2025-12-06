// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

///
/// @title MyToken - Basic ERC-20 Token
/// @dev This contract shows a minimal and clean implementation of the ERC-20 standard.
///

contract MyToken {

    // ----------------------------------------------------------
    // Token Details
    // ----------------------------------------------------------

    // Full token name (used for display purposes)
    string public name = "MyToken";

    // Token shorthand / ticker symbol
    string public symbol = "MTK";

    // Number of decimal units the token uses (18 = same as ETH)
    uint8 public decimals = 18;

    // Total number of tokens created during deployment
    uint256 public totalSupply;

    // ----------------------------------------------------------
    // Storage: balances and allowances
    // ----------------------------------------------------------

    // Stores how many tokens each address owns
    mapping(address => uint256) public balanceOf;

    // Records how much a spender can use from an owner’s tokens
    mapping(address => mapping(address => uint256)) public allowance;

    // ----------------------------------------------------------
    // ERC-20 Events
    // ----------------------------------------------------------

    // Triggered whenever tokens move from one address to another
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // Triggered when an owner sets or updates a spender’s allowance
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    // ----------------------------------------------------------
    // Constructor
    // ----------------------------------------------------------

    /// @notice Mints the entire supply to whoever deploys the contract.
    /// @param _initialSupply Total supply including decimals.
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;

        // Give every token to the contract deployer
        balanceOf[msg.sender] = _initialSupply;

        // Record the minting as a transfer from the zero address
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    // ----------------------------------------------------------
    // ERC-20 Functions
    // ----------------------------------------------------------

    /// @notice Allows the caller to send tokens to another wallet.
    /// @param _to Address receiving the tokens.
    /// @param _value Amount of tokens to transfer.
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid destination");
        require(balanceOf[msg.sender] >= _value, "Balance too low");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /// @notice Grants permission to another address to spend your tokens.
    /// @param _spender Address allowed to spend tokens.
    /// @param _value Maximum amount allowed.
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0), "Invalid spender");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /// @notice Lets an approved spender transfer tokens on behalf of an owner.
    /// @param _from Address from which tokens are taken.
    /// @param _to Address receiving the tokens.
    /// @param _value Amount of tokens to transfer.
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid recipient");
        require(balanceOf[_from] >= _value, "Insufficient funds");
        require(allowance[_from][msg.sender] >= _value, "Not approved enough");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    // ----------------------------------------------------------
    // Utility Functions
    // ----------------------------------------------------------

    /// @notice Returns the total token supply.
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    /// @notice Convenience function to retrieve metadata in one call.
    function getTokenInfo()
        public
        view
        returns (
            string memory tokenName,
            string memory tokenSymbol,
            uint8 tokenDecimals,
            uint256 tokenSupply
        )
    {
        return (name, symbol, decimals, totalSupply);
    }
}
